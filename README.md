# Resume-PedroFontanarrosa
My JSON resume and automated build for ATS-friendly PDF and personal website


----
Use the following command to generate the PDF resume:

```bash
npx resume export resume.pdf --theme jsonresume-theme-professional
```

To generate the website, use the following command:

```bash
npx resume export index.html --theme jsonresume-theme-elegant
```

To deploy the website, use the following command:

```bash
npx gh-pages -d .
```

To install other json resume themes, use the following command:

```bash
npm install jsonresume-theme-<theme-name>
```

