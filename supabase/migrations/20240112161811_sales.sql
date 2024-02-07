create table "public"."sales" (
    "id" bigint generated by default as identity not null,
    "first_name" text not null,
    "last_name" text not null,
    "email" text not null,
    "user_id" uuid not null
);


alter table "public"."sales" enable row level security;

CREATE UNIQUE INDEX sales_pkey ON public.sales USING btree (id);

alter table "public"."sales" add constraint "sales_pkey" PRIMARY KEY using index "sales_pkey";

alter table "public"."sales" add constraint "sales_user_id_fkey" FOREIGN KEY (user_id) REFERENCES auth.users(id) not valid;

alter table "public"."sales" validate constraint "sales_user_id_fkey";

grant delete on table "public"."sales" to "anon";

grant insert on table "public"."sales" to "anon";

grant references on table "public"."sales" to "anon";

grant select on table "public"."sales" to "anon";

grant trigger on table "public"."sales" to "anon";

grant truncate on table "public"."sales" to "anon";

grant update on table "public"."sales" to "anon";

grant delete on table "public"."sales" to "authenticated";

grant insert on table "public"."sales" to "authenticated";

grant references on table "public"."sales" to "authenticated";

grant select on table "public"."sales" to "authenticated";

grant trigger on table "public"."sales" to "authenticated";

grant truncate on table "public"."sales" to "authenticated";

grant update on table "public"."sales" to "authenticated";

grant delete on table "public"."sales" to "service_role";

grant insert on table "public"."sales" to "service_role";

grant references on table "public"."sales" to "service_role";

grant select on table "public"."sales" to "service_role";

grant trigger on table "public"."sales" to "service_role";

grant truncate on table "public"."sales" to "service_role";

grant update on table "public"."sales" to "service_role";



