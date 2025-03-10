# Resume-PedroFontanarrosa

My JSON resume and automated build for an ATS-friendly PDF and personal website.

## First-Time Setup

If this is the first time you’re opening the workspace, run:

```bash
npm install
```

This will install all dependencies specified in your package.json.

## Updating Your Resume

After making changes to your resume.json, you have two different render options:

- **For your personal website:**  
  Generate the HTML file that will be deployed as your website:
  ```bash
  npx resumed render resume.json --theme jsonresume-theme-dev-ats --output docs/index.html
  ```

- **For PDF generation:**  
  Generate an HTML file for the PDF (this file must be named `temp-pdf.html` and placed in the docs folder):
  ```bash
  npx resumed render resume.json --theme jsonresume-theme-dev-ats --output docs/temp-pdf.html
  ```

> **Note:** The `node generate-pdf.js` script will look for and work only if there is a `temp-pdf.html` file in the docs folder. This setup allows you to use different themes for your website and your PDF resume.

## Generating a PDF

To generate your PDF, first ensure you have rendered your resume to `docs/temp-pdf.html` (using the command above), then run:

```bash
node generate-pdf.js
```

## Deploying to GitHub Pages

To deploy your website (the generated HTML), run:

```bash
npx gh-pages -d docs
```

## Additional Commands

- **Installing other JSON Resume themes:**
  ```bash
  npm install jsonresume-theme-<theme-name>
  ```

- **Listing all available themes:**
  ```bash
  npx resumed themes
  ```

- **Validating your resume.json:**
  ```bash
  npx resumed validate resume.json
  ```

## Using the Class Theme

The original `jsonresume-theme-class` was not working as expected. A fork of the theme has been installed. To generate your resume using the class theme, use the following command:

```bash
npx resumed render resume.json --theme @jsonresume/jsonresume-theme-class --output docs/index.html
```