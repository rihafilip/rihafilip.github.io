module Jekyll
  # Generates a detail page at /publications/<slug>/ for every entry in
  # _data/publications.yml, rendered with the `publication` layout.
  # The entry's fields become page variables; its `abstract` becomes the page content.
  class PublicationPageGenerator < Generator
    safe true

    def generate(site)
      Array(site.data["publications"]).each do |pub|
        slug = pub.fetch("slug")
        # .md so the abstract goes through the Markdown converter
        page = PageWithoutAFile.new(site, site.source, File.join("publications", slug), "index.md")
        page.content = pub["abstract"].to_s
        page.data.merge!(pub.reject { |key, _| key == "abstract" })
        page.data["layout"] = "publication"
        page.data["permalink"] = "/publications/#{slug}/"
        site.pages << page
      end
    end
  end
end
