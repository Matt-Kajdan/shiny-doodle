## Svelte Portfolio Site

This is a SvelteKit project for my software/design portfolio. It is configured for static export and lives in the `portfolio/` subfolder of the repo.

### Scripts
- `dev`: start the dev server
- `build`: static build to `portfolio/build`
- `preview`: preview the production build
- `test`: run Playwright tests
- `lint` / `format`: code style

### Run locally
```bash
cd portfolio
npm install
npm run dev
```

### Build
```bash
cd portfolio
npm run build
```

### Deploy
The site is statically exported using `@sveltejs/adapter-static`. The built assets are written to `portfolio/build`.
