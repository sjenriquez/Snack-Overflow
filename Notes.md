# Review Notes

## App Install

Worked!

## Basic use and UX

* If i screw up a field while entering a `Nom` i don't get any error messages
* If I upvote, I can't then downvote a `Nom`?
* The app does the minimum bar, I think there could have been a few extra
  bits of attention paid to UX so that error messages, broken flow cases,
  etc. were covered.  this is the sort of thing you can use an
  integration test for.  Basicially make sure that as you go from page to
  page doing tasks that you wind up getting messages / redirects in ways
  that are helpful to users.

## Tests

The test suite on master SHOULD ALWAYS PASS

## Controllers

Really nice, kept them clean.  Nicely delegated heavy lifting to Models. Thanks

## Models

Keep in mind that AR has many helpers to help you make efficient DB queries.
See:

http://guides.rubyonrails.org/active_record_querying.html#pluck

## Views Nice

## Overall

Great looking app on the oustide.  Inside also very nice as well.  You should
be proud of where this was.  Weak points were the testing.  Please try to have
more test coverage as you go into final projects.
