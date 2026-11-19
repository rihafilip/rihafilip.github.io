cv_sources := "--metadata-file=_data/profile.yml --metadata-file=_data/cv.yml --lua-filter=_templates/publications.lua"

cv out="files/cv.pdf":
    mkdir -p files
    pandoc /dev/null -f markdown {{cv_sources}} --template=_templates/cv.tex --pdf-engine=lualatex -o {{out}}

build baseurl="": cv
    bundle install
    JEKYLL_ENV=production bundle exec jekyll build --baseurl "{{baseurl}}"

check:
    bundle exec htmlproofer ./_site --disable-external

serve:
    bundle exec jekyll serve --livereload
