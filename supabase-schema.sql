create extension if not exists "uuid-ossp";

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text not null,
  role text not null default 'alumno',
  status text not null default 'active',
  created_at timestamptz not null default now()
);

create table if not exists public.students (
  id uuid primary key default uuid_generate_v4(),
  user_id uuid references public.profiles(id) on delete set null,
  first_name text not null,
  last_name text not null,
  email text,
  phone text,
  address text,
  admission_date date,
  weight_kg numeric,
  height_cm numeric,
  diseases text,
  injuries text,
  activity text,
  status text not null default 'active',
  created_at timestamptz not null default now()
);

create table if not exists public.payments (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references public.students(id) on delete cascade,
  amount numeric not null,
  due_date date not null,
  status text not null default 'pending',
  alias text,
  proof_url text,
  created_at timestamptz not null default now()
);

create table if not exists public.routines (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references public.students(id) on delete cascade,
  title text not null,
  weeks integer default 4,
  pdf_url text,
  created_at timestamptz not null default now()
);

create table if not exists public.attendance (
  id uuid primary key default uuid_generate_v4(),
  student_id uuid references public.students(id) on delete cascade,
  attendance_date date not null,
  created_at timestamptz not null default now()
);

create table if not exists public.settings (
  id uuid primary key default uuid_generate_v4(),
  gym_name text not null default 'DS GYM',
  alias text default 'Donsalvadorgym',
  logo_url text,
  colors jsonb default '{"primary":"#22c55e","background":"#050505"}'::jsonb,
  created_at timestamptz not null default now()
);

alter table public.profiles enable row level security;
alter table public.students enable row level security;
alter table public.payments enable row level security;
alter table public.routines enable row level security;
alter table public.attendance enable row level security;
alter table public.settings enable row level security;

drop policy if exists "profiles_read_own" on public.profiles;
create policy "profiles_read_own" on public.profiles
  for select using (auth.uid() = id);

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own" on public.profiles
  for insert with check (auth.uid() = id);

drop policy if exists "students_read_admin" on public.students;
create policy "students_read_admin" on public.students
  for select using (
    exists (
      select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'
    )
  );

drop policy if exists "students_insert_admin" on public.students;
create policy "students_insert_admin" on public.students
  for insert with check (
    exists (
      select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'
    )
  );

drop policy if exists "payments_read_admin" on public.payments;
create policy "payments_read_admin" on public.payments
  for select using (
    exists (
      select 1 from public.profiles p where p.id = auth.uid() and p.role = 'admin'
    )
  );

drop policy if exists "payments_insert_own" on public.payments;
create policy "payments_insert_own" on public.payments
  for insert with check (
    exists (
      select 1 from public.profiles p where p.id = auth.uid() and p.role = 'alumno'
    )
  );
