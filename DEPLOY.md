# Despliegue DS GYM

## 1. Tener listo el repositorio
- Asegúrate de que este proyecto está subido a GitHub o GitLab.
- Vercel necesita un repositorio remoto para desplegarlo.

## 2. Configurar Supabase
- Ya tienes el SQL ejecutado correctamente.
- Usa estos valores en Vercel:
  - NEXT_PUBLIC_SUPABASE_URL = https://tyvbsfouhxdzqtjjjikc.supabase.co
  - NEXT_PUBLIC_SUPABASE_ANON_KEY = eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR5dmJzZm91aHhkenF0ampqaWtjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI5OTI4NDYsImV4cCI6MjA5ODU2ODg0Nn0.kXkj0ye_3-uwdtCVwz5broSlgI2GA3SiaNN0bgHabfo

## 3. Desplegar en Vercel
1. Entra a https://vercel.com y inicia sesión.
2. Haz clic en "Add New..." > "Project".
3. Importa este repositorio desde GitHub/GitLab.
4. Cuando Vercel te pida configurar el proyecto, selecciona el framework "Next.js".
5. En "Environment Variables", añade:
   - NEXT_PUBLIC_SUPABASE_URL
   - NEXT_PUBLIC_SUPABASE_ANON_KEY
6. Haz clic en "Deploy".

## 4. Después del despliegue
- Vercel te dará una URL como `https://tu-proyecto.vercel.app`.
- Abre esa URL y prueba:
  - login
  - registro
  - dashboard

## 5. Si algo falla
- Revisa que las variables de entorno estén exactamente iguales que en Supabase.
- Revisa que el proyecto en Vercel esté usando el branch correcto.
- Si una nueva versión falla, Vercel te muestra el error en la pestaña "Deployments".
