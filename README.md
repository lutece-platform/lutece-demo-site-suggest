# lutece-demo-site-suggest
Lutece Demo site for the Suggest plugin.

## Features

The Suggest plugin allows users to submit ideas, proposals or questions for submitting to votes and comments from visitors. It allows for public consultations and discussion forums.

## Main Features

 
* Dynamically creates a content type that can be submitted by users. A content type is created by selecting the different fields that should beprovided by the user when submitting a proposal.
* Management of the content deposited by the users (publication, publication, deletion of certain proposals and comments).
* Ability to filter proposals by date of publication, category or by means of a search field.
* Possibility to order proposals by popularity or chronological order.

## Authentication Management

 
* Ability to require the user to be authenticated in order to vote, comment or submit a proposal.
* Ability to prevent a user from voting multiple times for the same proposal.

## Moderation of content submitted by users

 
* Ability to require proposals and comments to be published only after verification by the moderator (s) of the sugg.
* Send email notification when submitting a proposal, comment or report of a proposal considered inadequate

## Other Features

 
* Enabling / disabling a suggest with an unavailable message.
* Consultation of proposals and comments with possibility of export.
* Control of user input by regular expressions.
* Ability to add a Captcha in the proposal entry form. (I.e available by the addition of a Captcha)
* Managing regular expressions, managing export xsl, managing categories ...


## build the image

`docker build -t site-suggest-demo .`

All Lutece images are available at https://hub.docker.com/u/lutece/

## Launch the server


`docker run -p 80:8080 site-suggest-demo`

## Connect to the server to see the service

'http://localhost/suggest'


## Back office management

'http://localhost/suggest/jsp/admin/AdminMenu.jsp'

Connect to the back office with login/pwd : admin/suggest

## Run the image from docker hub without building it locally

`docker run -p 80:8080 lutece/suggest`


## Sources
All Lutece sources are available  at :
'https://github.com/lutece-platform'

more information about Lutece framework : 'https://fr.lutece.paris.fr/fr/wiki/home.html'
