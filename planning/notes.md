# Voting Site v1

## Features

- User accounts
  - Google OAuth?? <- down the line
  - Password recovery
  - Different permission levels - admin vs. regular
    - Admin accts can manage other user accounts (delete, reset pwd)
    - Admin accts can manage polls (create, delete etc.)
    - Admin accts can access useage data (who has/hasn't voted, etc.)
    - Regular accts can create polls, must get approval from admin acct

- Polls
  - All users can view polls (results hidden till complete?)
  - Admin users can view voting progress
  - New polls must receive admin approval
  - What kind of polls? Just yes or no polls can be one type maybe? Or always
    fill in all options?
  - Poll creator and admins should be able to edit polls
  - Provide write-in option?
  - Maybe users can submit a comment that won't be displayed, but will go to
    admins?


## Class Structure

### Users

**Users will have**:
  - A unique ID
  - A name
  - A list of polls created
  - A list of votes (accessible only by admins and that user)
  - An `@admin` flag

### Polls

**Polls will have**:
  - A unique ID
  - A name
  - Some number of options
  - A creator
  - A date created
  - An end date
  - A status (open or closed)

## Questions

- When should results be shown?
