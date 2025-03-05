# Resume-PedroFontanarrosa

My JSON resume and automated build for an ATS-friendly PDF and personal website.

## First-Time Setup

If this is your first time opening the workspace, run:

```bash
npm install
```

This installs all dependencies specified in your `package.json`.

## Updating Your Resume
After updating your `resume.json`, use the build script to regenerate both your HTML website and your PDF resume. The script supports using different themes for each output.

## Build Script Usage
The script accepts two optional parameters:

- First parameter: Theme for the HTML output.
- Second parameter: Theme for the PDF output (if omitted, it defaults to the first theme).

For example:
- Using the same theme for both HTML and PDF:
  ```bash
    node build-resume.js jsonresume-theme-even
  ```
- Using different themes for HTML and PDF:
  ```bash
    node build-resume.js jsonresume-theme-even jsonresume-theme-class
  ```

The script will generate:
- `docs/index.html` – the HTML version for your personal website.
- `docs/cv.pdf` – the PDF version of your resume.

## Deploying to GitHub Pages

To deploy your website (i.e., the generated HTML in the `docs` folder) to GitHub Pages, run:
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

## Project Structure

- `resume.json`: Your resume data in JSON format.
- `build-resume.js`: The build script that renders the resume to HTML and PDF using configurable themes.
- `docs/index.html`: Generated HTML output for your personal website.
- `docs/cv.pdf`: Generated PDF resume.
