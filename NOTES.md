End-user flows:

1. New user (dashboard-fe-srv) register_helper.rb
2. Existing user, new account (manage-src) — users.rb
3. Existing user, existing account (sandboxes-ruby-srv) — sandboxes_ruby-impl.rb

QA testing:

1. Successful PR build
2. https://amp.qa.corp.stripe.com/
3. Select QA
4. Select the appropriate service(s) for the codebase
5. Deploy (ignore most of the warning dialogs that come up)
6. Deploy go/dev Turbo QA Dashboard
7. Splunk logs:
   - Canonical lines
   - Ignore `NOT consoleAndFile`
   - Use `action_id` to tie requests together
8. Use `Basic Live Account` go/scenarios to make an account "live"
