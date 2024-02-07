create table "public"."contacts" (
    "id" bigint generated by default as identity not null,
    "first_name" text,
    "last_name" text,
    "gender" text,
    "title" text,
    "email" text,
    "phone_number1" text,
    "phone_number2" text,
    "background" text,
    "acquisition" text,
    "avatar" text,
    "first_seen" timestamp with time zone,
    "last_seen" timestamp with time zone,
    "has_newsletter" boolean,
    "status" text,
    "tags" bigint[],
    "company_id" bigint,
    "sales_id" bigint
);


alter table "public"."contacts" enable row level security;

CREATE UNIQUE INDEX contacts_pkey ON public.contacts USING btree (id);

alter table "public"."contacts" add constraint "contacts_pkey" PRIMARY KEY using index "contacts_pkey";

alter table "public"."contacts" add constraint "contacts_company_id_fkey" FOREIGN KEY (company_id) REFERENCES companies(id) ON UPDATE CASCADE ON DELETE CASCADE not valid;

alter table "public"."contacts" validate constraint "contacts_company_id_fkey";

alter table "public"."contacts" add constraint "contacts_sales_id_fkey" FOREIGN KEY (sales_id) REFERENCES sales(id) not valid;

alter table "public"."contacts" validate constraint "contacts_sales_id_fkey";

grant delete on table "public"."contacts" to "anon";

grant insert on table "public"."contacts" to "anon";

grant references on table "public"."contacts" to "anon";

grant select on table "public"."contacts" to "anon";

grant trigger on table "public"."contacts" to "anon";

grant truncate on table "public"."contacts" to "anon";

grant update on table "public"."contacts" to "anon";

grant delete on table "public"."contacts" to "authenticated";

grant insert on table "public"."contacts" to "authenticated";

grant references on table "public"."contacts" to "authenticated";

grant select on table "public"."contacts" to "authenticated";

grant trigger on table "public"."contacts" to "authenticated";

grant truncate on table "public"."contacts" to "authenticated";

grant update on table "public"."contacts" to "authenticated";

grant delete on table "public"."contacts" to "service_role";

grant insert on table "public"."contacts" to "service_role";

grant references on table "public"."contacts" to "service_role";

grant select on table "public"."contacts" to "service_role";

grant trigger on table "public"."contacts" to "service_role";

grant truncate on table "public"."contacts" to "service_role";

grant update on table "public"."contacts" to "service_role";

create policy "Enable read access for all users"
on "public"."contacts"
as permissive
for select
to authenticated
using (true);