import { promises as fs } from 'fs';
import puppeteer from 'puppeteer';
import { render } from 'resumed';
import path from 'path';

// Helper function: load a theme and return its default export if available.
function loadTheme(themeName) {
    return import(themeName).then(mod => mod.default || mod);
}

// Get themes from command-line arguments
const htmlThemeName = process.argv[2] || 'jsonresume-theme-even';
const pdfThemeName = process.argv[3] || htmlThemeName;

// Load both themes
Promise.all([loadTheme(htmlThemeName), loadTheme(pdfThemeName)])
    .then(async ([htmlTheme, pdfTheme]) => {
        async function buildResume() {
            try {
                // Read and parse resume.json
                const resumeData = await fs.readFile('resume.json', 'utf-8');
                const resume = JSON.parse(resumeData);

                // Render HTML using the HTML theme
                const htmlContent = await render(resume, htmlTheme);
                await fs.mkdir('docs', { recursive: true });
                const htmlFilePath = 'docs/index.html';
                await fs.writeFile(htmlFilePath, htmlContent, 'utf-8');
                console.log(`HTML file generated at ${htmlFilePath}`);

                // Render HTML for PDF using the PDF theme
                const pdfHtmlContent = await render(resume, pdfTheme);
                const tempPdfHtmlPath = 'docs/pdf-temp.html';
                await fs.writeFile(tempPdfHtmlPath, pdfHtmlContent, 'utf-8');

                // Use Puppeteer to generate the PDF
                const browser = await puppeteer.launch();
                const page = await browser.newPage();
                const fullPath = 'file://' + path.resolve(tempPdfHtmlPath);
                await page.goto(fullPath, { waitUntil: 'networkidle0' });
                const pdfPath = 'docs/cv.pdf';
                await page.pdf({ path: pdfPath, format: 'A4', printBackground: true });
                console.log(`PDF file generated at ${pdfPath}`);
                await browser.close();

                // Remove the temporary HTML file
                await fs.unlink(tempPdfHtmlPath);
            } catch (error) {
                console.error('Error generating resume:', error);
            }
        }
        buildResume();
    })
    .catch(err => {
        console.error('Error importing themes:', err);
    });
