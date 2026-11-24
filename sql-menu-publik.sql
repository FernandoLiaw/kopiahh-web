-- Jalankan SEKALI di Supabase (SQL Editor) project aplikasi Kopi Ahh.
-- Membuka HANYA nama, kategori, harga & foto menu aktif untuk website publik kopiahh.com.
-- COGS, stok, penjualan & data lain tetap rahasia.
create or replace function menu_publik()
returns table(id bigint, nama text, kategori text, harga int, img text)
language sql stable security definer set search_path = public as $$
  select id, nama, kategori, harga, img from menu where aktif order by kategori, id
$$;
revoke all on function menu_publik() from public;
grant execute on function menu_publik() to anon, authenticated;
