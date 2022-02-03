::
::  expo mainui %index
::
/-  *expo, store=graph-store, *group, *group-store
::
/+  schooner
::
|_  [bol=bowl:gall meep=moop]
::
++  build
  |=  [requested-page=@tas args=(list (pair @t @t))]
  |^
  ^-  manx
  ?.  =(%index requested-page)
    (stock-error (my args) 404)
  (main-page (my args))
  ::
  ++  stock-error
    |=  [url-params=(map @t @t) code=@ud]
    ;html
      ;head
        ;title:"{-:(title-content code)}"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
      ==
      ;body
        ;span(class "blur-banner")
          ;h2:"{-:(title-content code)}"
          ;p:"{+:(title-content code)}"
        ==
      ==
    ==
  ::
  ++  main-page
    |=  url-params=(map @t @t)
    ^-  manx
    ;html
      ;head
        ;title: "%expo dash"
        ;meta(name "viewport", content "width=device-width, initial-scale=1", charset "utf-8");
        ;style:"{(trip style)}"
        ;div(align "right")
          ;form(method "POST", id "res-select", name "res-select")
            ;select(name "resource", id "resource")
              ;option(value "none", selected "true"):"none selected"
              ;*  ^-  marl
                  %+  roll  ~(tap in ~(key by meep))
                  |=  [res=resource:store ops=marl]
                  =+  rat="{(scow %p entity.res)}|{(scow %tas name.res)}"
                  =+  fancy-rat="[{(scow %p entity.res)} %{(scow %tas name.res)}]"
                  :_  ops
                  ;option(value rat):"{fancy-rat}"
            ==
            ;button(type "submit", name "select", value "show-group"):"submit"     
          ==
        ==
      ==
      ;+  =/  sel=(unit @t)  (~(get by url-params) 'resource')
          ?~  sel
            ;body
              ;p:"{<(~(get by url-params) 'resource')>}"
              ;p:"get bodied"
            ==
          =/  who-wat=(unit [dime tape])
            %+  rush  u.sel
            ;~(pfix sig ;~((glue bar) crub:so (star next)))
          ?~  who-wat
            ;body
              ;p:"something went wrong..."
            ==
          ?>  ?=(%p -<.u.who-wat)
          =+  [ship=`@p`q.-.u.who-wat res=`@tas`(crip +.u.who-wat)]
          ?.  (~(has by meep) [ship res])
            ;body
              ;p:"I couldn't find that group"
            ==
          ;body
            ;script:"{(trip script)}"
            ;div(align "center")
              ;table(class "output")
                ;tr
                  ;td
                    ;h3:"info:"
                  ==
                  ;td(width "200px")
                    ;br;
                  ==
                  ;td
                    ;h3:"pokes:"
                  ==
                ==
                ;tr(vertical-align "top")
                  ;td
                    ;h4:"members:"
                    ;+  (memb-maker (~(got by meep) [ship res]))
                    ;button(onclick "copy(\"members\")"):"copy"
                  ==
                  ;td(width "200px")
                    ;br;
                  ==
                  ;td(class "right-column")
                    ;h4:"settings:"
                    ;input(class "resource", name "newsource", id "newsource", value "[{<ship>} {<res>}]");
                    ;br;
                    ;input(class "resource", name "setship", id "setship", value "~sed ~zod");
                    ;br;
                    ;p:"galaxy = %czar, star = %king, planet = %duke, moon = %earl, comet = %pawn"
                    ;input(class "resource", name "ranks", id "ranks", value "%pawn");
                    ;br;
                    ;button(onclick "update()"):"update pokes"
                    ;br;
                    ;h5:"add members:"
                    ;input(class "inside", name "add-members", id "add-members", value ":group-store &group-update-0 [%add-members [{<ship>} {<res>}] (sy ~[~sed ~zod])]");
                    ;button(onclick "copy(\"add-members\")"):"copy"
                  ==
                ==
                ;tr(vertical-align "top")
                  ;td
                    ;h3:"admins:"
                    ;+  =-  (admin-maker (~(get ju tags.-) %admin))
                        (~(got by meep) [ship res])
                    ;button(onclick "copy(\"admin\")"):"copy"
                  ==
                  ;td(width "200px")
                    ;br;
                  ==
                  ;td
                    ;h5:"ban ships:"
                    ;input(class "inside", name "ban-members", id "ban-members", value ":group-store &group-update-0 [%change-policy [{<ship>} {<res>}] [%open [%ban-ships (sy ~[~sed ~zod])]]]");
                    ;button(onclick "copy(\"ban-members\")"):"copy"
                    ;br;
                    ;h5:"unban ships:"
                    ;input(class "inside", name "unban-members", id "unban-members", value ":group-store &group-update-0 [%change-policy [{<ship>} {<res>}] [%open [%allow-ships (sy ~[~sed ~zod])]]]");
                    ;button(onclick "copy(\"unban-members\")"):"copy"
                    ;br;
                    ;br;
                    ;h5:"ban ranks"
                    ;input(class "inside", name "ban-ranks", id "ban-ranks", value ":group-store &group-update-0 [%change-policy [{<ship>} {<res>}] [%open [%ban-ranks (sy ~[%pawn])]]]");
                    ;button(onclick "copy(\"ban-ranks\")"):"copy"
                    ;br;
                    ;h5:"unban ranks"
                    ;input(class "inside", name "unban-ranks", id "unban-ranks", value ":group-store &group-update-0 [%change-policy [{<ship>} {<res>}] [%open [%allow-ranks (sy ~[%pawn])]]]");
                    ;button(onclick "copy(\"unban-ranks\")"):"copy"
                  ==
                ==
              ==
            ==
          ==
    ==
  ::
  ++  admin-maker
    |=  men=(set @p)
    =+  [adm=~(tap in men) dum='']
    |-
    ?~  adm
      ;textarea(readonly "", name "admins", id "admins"):"{(trip dum)}"
    %=  $
      adm  t.adm
      dum  (rap 3 (scot %p i.adm) '\0d' dum ~)
    ==
  ::
  ++  memb-maker
    |=  =group
    =+  [mum=~(tap in members.group) dum='']
    |-
    ?~  mum
      ;textarea(readonly "", name "members", id "members"):"{(trip dum)}"
    %=  $
      mum  t.mum
      dum  (rap 3 (scot %p i.mum) '\0d' dum ~)
    ==
  ::
  ++  title-content
    |=  status=@ud
    ?+  status
      :-  "500 Error - Internal Server Error" 
      ;:  weld  "This urbit is experiencing presence. "
        "You might try back later, or ask again. "
        "Sorry for the inconvenience."
      ==
      ::
        %403
      :-  "403 Error - FORBIDDEN!"
      ;:  weld  "Another one of them new worlds. "
        "No beer, no women, no pool partners, nothin'. "
        "Nothin' to do but throw rocks at tin cans, and we have to bring our own tin cans."
      ==
      ::
        %404
      :-  "404 Error - Page Not Found"
      %+  weld  "You've attempted to access absence. "
      "Impossible. Try a different path. Sorry for the inconvenience."
      ::
        %405
      :-  "405 Error - Method Not Allowed"
      %+  weld  "Something went wrong with your request. "
      "You should probably just go back. Sorry for the inconvenience."
      ::
    ==
  ::
  ++  style
    '''
    * { margin: 0.2em; padding: 0.2em; font-family: monospace; }
    .output {
      width: 70vw;
      height: 60vh;
      }
    .resource {
      width: 40em;
    }
    .inside {
      width: 70em;
    }
    .right-column {
      width: 50em;
    }
    .blur-banner { 
        position: relative; 
        top: 60%; 
        left: 0%; 
        right: 0%; 
        bottom: 0%; 
        height: auto; 
        width: 80%; 
        padding: 15px 15px 15px 15px; 
        margin: 0px auto 0px auto; 
        display: block; 
        background: rgba(255, 255, 255, 1.0); 
        font-size: 14pt; 
        color: #997300; 
        font-family: Menlo, Consolas, Monaco, "Lucida Console", monospace; 
        border: 6px #997300 dashed; 
        border-radius: 20px; 
        filter: blur(2px) sepia(25%) brightness(100%) saturate(173%); 
        -webkit-filter: blur(1.5px) sepia(25%) brightness(100%) saturate(175%); 
        -moz-filter: blur(1.5px) sepia(25%) brightness(100%) saturate(175%); 
        -ms-filter: blur(1.5px) sepia(25%) brightness(100%) saturate(175%); 
        -o-filter: blur(1.5px) sepia(25%) brightness(100%) saturate(175%); 
      }
    '''
  ::
  ++  script
    '''
    var copy = (id) => {
      let textarea = document.getElementById(id);
      textarea.select();
      document.execCommand("copy");
    }
    var update = () => {
      let res = document.getElementById("newsource").value;
      let shi = document.getElementById("setship").value;
      let ran = document.getElementById("ranks").value;

      document.getElementById("add-members").value = `:group-store &group-update-0 [%add-members [${res}] (sy ~[${shi}])]`
      document.getElementById("ban-members").value = `:group-store &group-update-0 [%change-policy [${res}] [%open [%ban-ships (sy ~[${shi}])]]]`
      document.getElementById("unban-members").value = `:group-store &group-update-0 [%change-policy [${res}] [%open [%allow-ships (sy ~[${shi}])]]]`
      document.getElementById("ban-ranks").value = `:group-store &group-update-0 [%change-policy [${res}] [%open [%ban-ranks (sy ~[${ran}])]]]`
      document.getElementById("unban-ranks").value = `:group-store &group-update-0 [%change-policy [${res}] [%open [%allow-ranks (sy ~[${ran}])]]]`
    }
    '''
  --
--