// @ts-check

import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from "astro/config";

import db from "@astrojs/db";
import react from "@astrojs/react";

import node from "@astrojs/node";

// https://astro.build/config
export default defineConfig({
  vite: {
    plugins: [tailwindcss()],
  },

  integrations: [react(), db()],
  site: "https://waitlist.getkontinue.com", // For processing the waitlist action

  adapter: node({
    mode: "standalone",
  }),
  output: "static",
});
