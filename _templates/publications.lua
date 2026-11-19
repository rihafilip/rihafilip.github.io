-- Exposes _data/publications.yml (a map keyed by slug) as a `publications` list, newest first
function Meta(meta)
  local fh = assert(io.open("_data/publications.yml"))
  local pubs = pandoc.read("---\n" .. fh:read("a") .. "\n---\n", "markdown").meta
  fh:close()

  local list = {}
  for slug, p in pairs(pubs) do
    if not p.bib.exclude then
      p.slug = slug
      table.insert(list, p)
    end
  end

  local function year(p) return tonumber(pandoc.utils.stringify(p.info.year)) end
  table.sort(list, function(a, b) return year(a) > year(b) end)

  meta.publications = list
  return meta
end
