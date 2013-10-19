USAGE

```
bundle install
export GLASSFROG_KEY=$YOUR_GLASSFROG_KEY
ruby email_list.rb "$CIRCLE_NAME_YOU_CARE_ABOUT" "$ROLES_WITHIN_CIRCLE"
# Usually that's the name, sometimes there's a different name in italicized parens. 
# If you want to get admin members, just enter in 'Facilitators' or 'Secretary' in place of circle
```

I didn't really test this
