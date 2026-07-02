# DS GYM

Aplicación web profesional para gimnasios, construida con Next.js, TypeScript, Tailwind CSS y preparada para integrar Supabase y desplegar en Vercel.

## Stack

- Frontend: Next.js + TypeScript + Tailwind CSS
- Backend: Supabase
- Base de datos: PostgreSQL en Supabase
- Auth: Supabase Auth
- Storage: Supabase Storage
- Hosting: Vercel

## Variables de entorno

- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_ANON_KEY

## Desarrollo local

1. Instala dependencias con `npm install`
2. Copia `.env.local.example` a `.env.local`
3. Añade tus credenciales de Supabase
4. Inicia el servidor con `npm run dev`

## Despliegue en Vercel

1. Conecta este repositorio a Vercel
2. Añade las mismas variables de entorno en Vercel
3. Ejecuta el SQL de `supabase-schema.sql` en Supabase
4. Haz deploy

## Archivos clave

- [supabase-schema.sql](supabase-schema.sql)
- [DEPLOY.md](DEPLOY.md)
