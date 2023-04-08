versions_sources = [
  'main.vala',
  'application.vala',
  'window.vala',
]

versions_deps = [
  dependency('gtk4'),
  dependency('libadwaita-1', version: '>= 1.2'),
]

versions_sources += gnome.compile_resources('versions-resources',
  'versions.gresource.xml',
  c_name: 'versions'
)

executable('versions', versions_sources,
  dependencies: versions_deps,
       install: true,
)
