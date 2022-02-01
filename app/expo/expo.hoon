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
            ;h3:"members:"
            ;+  (memb-maker (~(got by meep) [ship res]))
            ;br;
            ;h3:"admins:"
            ;+  =-  (admin-maker (~(get ju tags.-) %admin))
                (~(got by meep) [ship res])
          ==
    ==
  ::
  ++  admin-maker
    |=  men=(set @p)
    =+  [adm=~(tap in men) dum='']
    |-
    ?~  adm
      ;input(name "admins", value (trip dum));
    %=  $
      adm  t.adm
      dum  (rap 3 (scot %p i.adm) ' ' dum ~)
    ==
  ::
  ++  memb-maker
    |=  =group
    =+  [mum=~(tap in members.group) dum='']
    |-
    ?~  mum
      ;input(readonly "", name "members", value (trip dum));
    %=  $
      mum  t.mum
      dum  (rap 3 (scot %p i.mum) ' ' dum ~)
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

    '''
  --
--