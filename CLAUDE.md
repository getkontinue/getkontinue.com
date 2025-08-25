# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This project uses Bun as the package manager and runtime. Key commands:

- `bun install` - Install dependencies
- `bun dev` - Start development server at localhost:4321
- `bun build` - Build production site to ./dist/
- `bun preview` - Preview production build locally
- `biome check` - Run linting (Biome is configured for formatting and linting)
- `biome format` - Format code using Biome

## Architecture Overview

This is an Astro-based landing page for Kontinue, an open-source alternative to Notion/Coda. The site is built using:

### Tech Stack
- **Framework**: Astro v5 with React integration
- **Styling**: TailwindCSS v4 with custom CSS variables
- **UI Components**: shadcn/ui components adapted for Astro
- **Icons**: Lucide React
- **Linting**: Biome (replaces ESLint/Prettier)
- **TypeScript**: Strict configuration with path aliases

### Project Structure
- `src/components/Welcome.astro` - Main landing page component with hero, features, and CTA sections
- `src/layouts/Layout.astro` - Base HTML layout with global styles
- `src/components/ui/` - Reusable UI components (Button, Card, Input, Badge) from shadcn/ui
- `src/lib/utils.ts` - Utility functions (cn for className merging)
- `src/styles/global.css` - Global CSS with TailwindCSS imports
- `public/fonts/` - Inter font files for typography

### Key Configurations
- **Path Aliases**: `@/` maps to `./src/`
- **shadcn/ui**: Configured in `components.json` with New York style, stone base color
- **TailwindCSS**: v4 integrated via Vite plugin, CSS variables enabled
- **Biome**: Configured for double quotes, space indentation, with special overrides for .astro files

### Component Architecture
The main page is built as a single Astro component with multiple sections:
- Header with navigation
- Hero section with email signup
- Problem/solution sections
- Feature cards grid
- Target audience section
- Footer with social links

UI components follow shadcn/ui patterns but are adapted for Astro with TypeScript support.