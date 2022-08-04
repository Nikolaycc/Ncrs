# Ncrs

A low-level ncurses wrapper for Crystal

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     ncrs:
       github: nikolaykys/ncrs
   ```

2. Run `shards install`

## Usage

```crystal
require "ncrs"
```

## Example

```crystal
require "ncrs"

app = Ncrs::Ui.new

app.noecho

app.prtln "Type any character to see it in bold"

ch = app.input "Input: "

app.prtln "#{ch.unsafe_chr}", Ncrs::Consts::A_BOLD

app.ref
app.input
app.end
```


## Development

```bash
$ shards build
```

## Contributing

1. Fork it (<https://github.com/your-github-user/ncrs/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [NikolayKYS](https://github.com/your-github-user) - creator and maintainer
