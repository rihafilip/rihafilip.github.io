cv_sources := "--metadata-file=_data/profile.yml --metadata-file=_data/cv.yml --lua-filter=_templates/publications.lua"

# Render the CV to files/cv.pdf
cv:
    pandoc /dev/null -f markdown {{cv_sources}} --template=_templates/cv.tex --pdf-engine=lualatex -o files/cv.pdf

# Build and validate the site as in CI
build:
    bundle install
    JEKYLL_ENV=production bundle exec jekyll build
    bundle exec htmlproofer ./_site --disable-external

serve:
    bundle exec jekyll serve --livereload
