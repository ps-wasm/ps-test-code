{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "PS to Wasm - 64 bit ints, 64 bit floats"
, dependencies =
  [ ] : List Text
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend = "pswasm-64bit"
}