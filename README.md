# Resume-PedroFontanarrosa

My JSON resume and automated build for an ATS-friendly PDF and personal website.

## First-Time Setup

If this is the first time you’re opening the workspace, run:

```bash
npm install
```
This will install all dependencies specified in your package.json.

Updating Your Resume
After making changes to your resume.json, re-render your resume as HTML with:

```bash
npx resumed render resume.json --theme jsonresume-theme-dev-ats --output docs/index.html
```

Replace `jsonresume-theme-dev-ats` with your preferred theme if needed.

## Generating a PDF
If you want to generate a PDF, use your existing PDF-generation setup (e.g., using Puppeteer):

```bash
node generate-pdf.js
```

## Deploying to GitHub Pages
To deploy your website (the generated HTML), run:

```bash
npx gh-pages -d docs
```

## Additional Commands
- To install other JSON Resume themes:
```bash
npm install jsonresume-theme-<theme-name>
```

- To list all available themes:
```bash
npx resumed themes
```

- To validate your resume.json:
```bash
npx resumed validate resume.json
```


