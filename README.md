# Acoustic API
A Ruby wrapper for the Acoustic API

## Installation

    $ gem install goacoustic

## Documentation

[http://rdoc.info/gems/goacoustic](http://rdoc.info/gems/goacoustic)


## Usage Examples
    require 'acoustic'
    require 'oauth2'

    #Generate your OAuth2 access token
    client = OAuth2::Client.new(ACOUSTIC_CLIENT_ID, ACOUSTIC_CLIENT_SECRET, site: "https://api-campaign-us-1.goacoustic.com/oauth/token")
    access_token = OAuth2::AccessToken.from_hash(client, refresh_token: ACOUSTIC_REFRESH_TOKEN).refresh!

    @client = Acoustic.new({access_token: access_token.token, url: "https://api-campaign-us-1.goacoustic.com"})

    #add_recipeint
    #pass in user variables, database contact list, and contact list id
    a = @client.add_recipient({email:"test@example.com"}, 123, [456])
    resp.Envelope.Body.RESULT.SUCCESS # => "TRUE"

## Contributing
In the spirit of [free software][free-sw], **everyone** is encouraged to help improve
this project.

[free-sw]: http://www.fsf.org/licensing/essays/free-sw.html

Here are some ways *you* can contribute:

* by using alpha, beta, and prerelease versions
* by reporting bugs
* by suggesting new features
* by writing or editing documentation
* by writing specifications
* by writing code (**no patch is too small**: fix typos, add comments, clean up
  inconsistent whitespace)
* by refactoring code
* by fixing [issues][]
* by reviewing patches

[issues]: http://github.com/harman-signal-processing/goacoustic/issues

## Submitting an Issue
We use the [GitHub issue tracker][issues] to track bugs and features. Before
submitting a bug report or feature request, check to make sure it hasn't
already been submitted. When submitting a bug report, please include a [Gist][]
that includes a stack trace and any details that may be necessary to reproduce
the bug, including your gem version, Ruby version, and operating system.
Ideally, a bug report should include a pull request with failing specs.

[gist]: https://gist.github.com/

## Submitting a Pull Request
1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake spec`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake spec`. If your specs fail, return to step 5.
7. Run `open coverage/index.html`. If your changes are not completely covered
   by your tests, return to step 3.
8. Add documentation for your feature or bug fix.
9. Run `bundle exec rake yard`. If your changes are not 100% documented, go
   back to step 8.
10. Add, commit, and push your changes.
11. [Submit a pull request.][pr]

[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/

## Copyright
Copyright (c) 2020 Harman. See [LICENSE][] for details.

[license]: https://github.com/harman-signal-processing/goacoustic/blob/master/LICENSE.md

