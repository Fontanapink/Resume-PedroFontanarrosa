const puppeteer = require('puppeteer');
const path = require('path');

(async () => {
    const browser = await puppeteer.launch({
        args: ['--no-sandbox', '--disable-setuid-sandbox']
    });
    const page = await browser.newPage();
    const htmlFilePath = 'file://' + path.resolve('docs/temp-pdf.html');
    await page.goto(htmlFilePath, { waitUntil: 'networkidle0' });
    await page.pdf({ path: 'docs/cv.pdf', format: 'A4' });
    await browser.close();
})();
