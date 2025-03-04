// filepath: generate-pdf.js
const puppeteer = require('puppeteer');
const path = require('path');

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();
    const htmlFilePath = 'file://' + path.resolve('docs/index.html');
    await page.goto(htmlFilePath, { waitUntil: 'networkidle0' });
    await page.pdf({ path: 'docs/cv.pdf', format: 'A4' });
    await browser.close();
})();