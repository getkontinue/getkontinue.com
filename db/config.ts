import { column, defineDb, defineTable, NOW } from "astro:db";

const EmailSignup = defineTable({
  columns: {
    id: column.number({ primaryKey: true }),
    email: column.text(),
    signedUpAt: column.date({ default: NOW }),
  },
});

// https://astro.build/db/config
export default defineDb({
  tables: { EmailSignup },
});
