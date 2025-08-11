# SvelteKit Portfolio Site

My super-simple portfolio website built with SvelteKit, TypeScript, and Vite. Features responsive design, accessibility best practices, and static export for easy deployment.

## Quick Start

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build
```

## Project Structure

```
src/
├── lib/components/          # Reusable components (Card, Modal, Navbar, Project)
├── routes/                  # Page routes and layouts
├── static/                  # Images and assets
└── global.css               # Global styles and CSS variables
```

## Key Features

- **Responsive Layout**: Automatically adapts from desktop (side-by-side) to mobile (stacked)
- **Image Gallery**: Modal viewer with keyboard navigation (although the projects don't have multiple images for now)
- **Dark/Light Mode**: Automatic theme switching
- **Static Export**: Built with `@sveltejs/adapter-static` for easy hosting

## Why SvelteKit?

- **Zero JS by default** - Only loads JavaScript when needed
- **Static generation** - Perfect for portfolio sites
- **Built-in routing** - File-based routing with automatic code splitting
- **TypeScript support** - Full type safety and IntelliSense

## Deployment

The site builds to a `build/` folder ready for any static hosting service (GitHub Pages, Netlify, Vercel, etc.).

## Notice

**All images, designs, and visual content displayed on this portfolio site are 100% my own original work (Matt Kajdan). I claim full copyright on all visual assets and designs showcased here.**
You can see the current version of the deployed site at mkajdan.com
---

© 2024 Matt Kajdan - MK Studio
