::
::  expo app file
/-  *expo, *group, gs=group-store, store=graph-store
/+  default-agent, dbug, server, schooner, *pal
/~  mainui  webpage  /app/expo
::
|%
+$  versioned-state
  $%  state-zero
  ==
::
+$  state-zero
  [%0 =moop]
::
+$  card     card:agent:gall
+$  eyre-id  @ta
--
::
%-  agent:dbug
::
=|  state-zero
=*  state  -
::
^-  agent:gall
=<
|_  =bowl:gall
+*  this  .
    def   ~(. (default-agent this %|) bowl)
    hc    ~(. +> bowl)
::
++  on-init
  ^-  (quip card _this)
  ~&  >  [%expo %start ~]
  =+  [[~ [%apps %expo ~]] dap.bowl]
  :_  this
  :~  [%pass /eyre/connect %arvo %e %connect -]
      [%pass /expo/groups %agent [our.bowl %group-store] %watch [%groups ~]]
  ==
::
++  on-save
  ^-  vase
  !>(state)
::
++  on-load
  |=  ole=vase
  =/  old=versioned-state  !<(versioned-state ole)
  =+  caz=*(list card)
  =?    caz
      =+  ben=[(scot %p our.bowl) %bindings (scot %da now.bowl) ~]
      ?!  %-  %~  has  by  %-  malt
            .^((list [binding:eyre duct action:eyre]) %e ben)
          [~ [%apps %expo ~]]
    ~&  >>  [%expo %reload %expo %eyre ~]
    =+  [[~ [%apps %expo ~]] dap.bowl]
    [[%pass /eyre/connect %arvo %e %connect -] caz]
  =?    caz
      !(~(has by wex.bowl) [/expo/groups our.bowl %group-store])
    ~&  >>  [%expo %resub %group %store ~]
    :_  caz
    [%pass /expo/groups %agent [our.bowl %group-store] %watch [%groups ~]]
  ~&  >  [%expo %reload ~]
  [caz this(state old)]
::
++  on-arvo
  |=  [=wire =sign-arvo]
  ^-  (quip card _this)
  ?+  sign-arvo  (on-arvo:def wire sign-arvo)
      [%eyre %bound *]
    ~?  !accepted.sign-arvo
      [dap.bowl [%eyre %bind %fail] binding.sign-arvo]
    `this
  ==
::
++  on-poke
  |=  [=mark =vase]
  ^-  (quip card _this)
    ?+    mark  (on-poke:def mark vase)
        %handle-http-request
      =^  cards  state
        (weave:hc !<([=eyre-id =inbound-request:eyre] vase))
      [cards this]
    ==
::
++  on-agent
  |=  [=wire =sign:agent:gall]
  ?+    -.sign  `this
      %watch-ack
    ?:  =(~ p.sign)
      `this
    ~&  >>>  [%watch-nack wire %group-store ~]
    `this
  ::
      %kick
    :_  this
    [%pass /expo/groups %agent [our.bowl %group-store] %watch [%groups ~]]~
  ::
      %fact
    =^  cards  state
      ~|  :*  %unexpected-fact  p.cage.sign
              %for  dap.bowl  %from  src.bowl
          ==
      ?+    p.cage.sign  !!
          %group-update-0
        =/  gup=update:gs  !<(update:gs q.cage.sign)
        (ravel:hc gup)
      ==
    [cards this]
  ==
++  on-watch
  |=  =path
  `this
++  on-peek   on-peek:def
++  on-leave  on-leave:def
++  on-fail   on-fail:def
--
|_  bol=bowl:gall
++  ravel
  |=  gop=update:gs
  |^
  ?-  -.gop
    %expose          (expose +.gop)
    %add-tag         (add-tag resource.gop tag.gop ships.gop)
    %initial         (initial groups.gop)
    %add-group       (add-group resource.gop policy.gop hidden.gop)
    %remove-tag      (remove-tag resource.gop tag.gop ships.gop)
    %add-members     (add-members resource.gop ships.gop)
    %remove-group    (remove-group +.gop)
    %change-policy   (change-policy resource.gop diff.gop)
    %initial-group   `state
    %remove-members  (remove-members resource.gop ships.gop)
  ==
  ::
  ++  initial
    |=  goop=groups
    =/  loup=(list [r=resource:store s=group])
      ~(tap by goop)
    |-
    ?~  loup
      `state
    ?.  =(our.bol -.r.i.loup)
      $(loup t.loup)
    =.  moop
      (~(put by moop) r.i.loup s.i.loup)
    $(loup t.loup)
  ::
  ++  dif-ju
    |=  [=tags =tag remove=(set ship)]
    =/  ships  ~(tap in remove)
    |-
    ?~  ships
      tags
    $(tags (~(del ju tags) tag i.ships), ships t.ships)
  ::
  ++  expose
    |=  [rid=resource:store ~]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =/  =group
      (~(got by moop) rid)
    =.  hidden.group  %.n
    =.  moop
      (~(put by moop) rid group)
    `state
  ::
  ++  add-group
    |=  [rid=resource:store =policy hidden=?]
    ^-  (quip card _state)
    ?.  (team:title our.bol -.rid)  `state
    =|  =group
    =.  policy.group   policy
    =.  hidden.group   hidden
    =.  tags.group
      (~(put ju tags.group) %admin our.bol)
    =.  moop
      (~(put by moop) rid group)
    `state
  ::
  ++  add-members
    |=  [rid=resource:store new-ships=(set ship)]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =.  moop
      %+  ~(jab by moop)  rid
      |=  group
      %=  +<
        members  (~(uni in members) new-ships)
      ::
          policy
        ?.  ?=(%invite -.policy)
          policy
        policy(pending (~(dif in pending.policy) new-ships))
      ==
    `state
  ::
  ++  remove-members
    |=  [rid=resource:store ships=(set ship)]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =.  moop
      %+  ~(jab by moop)  rid
      |=  group
      %=  +<
        members  (~(dif in members) ships)
        tags  (remove-tags +< ships)
      ==
    `state
  ::
  ++  add-tag
    |=  [rid=resource:store =tag ships=(set ship)]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =.  moop
      %+  ~(jab by moop)  rid
      |=  group
      ?>  ?=(~ (~(dif in ships) members))
      +<(tags (merge-tags tags ships (sy tag ~)))
    `state
  ::
  ++  merge-tags
    |=  [=tags ships=(set ship) new-tags=(set tag)]
    ^+  tags
    =/  tags-list  ~(tap in new-tags)
    |-
    ?~  tags-list
      tags
    =*  tag  i.tags-list
    =/  old-ships=(set ship)
      (~(gut by tags) tag ~)
    %=    $
      tags-list  t.tags-list
    ::
        tags
      %+  ~(put by tags)
        tag
      (~(uni in old-ships) ships)
    ==
  ::
  ++  remove-tags
    |=  [=group ships=(set ship)]
    ^-  tags
    %-  malt
    %+  turn
      ~(tap by tags.group)
    |=  [=tag tagged=(set ship)]
    :-  tag
    (~(dif in tagged) ships)
  ::
  ++  remove-tag
    |=  [rid=resource:store =tag ships=(set ship)]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =.  moop
      %+  ~(jab by moop)  rid
      |=  group
      ?>  ?&  ?=(~ (~(dif in ships) members))
              (~(has by tags) tag)
          ==
      %=  +<
        tags  (dif-ju tags tag ships)
      ==
    `state
  ::
  ++  remove-group
    |=  [rid=resource:store ~]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =.  moop
      (~(del by moop) rid)
    `state
  ::
  ++  change-policy
    |=  [rid=resource:store =diff:policy]
    ^-  (quip card _state)
    ?.  ?&((~(has by moop) rid) (team:title our.bol -.rid))  `state
    =/  =group
      (~(got by moop) rid)
    |^
    =^  cards  group
      ?-  -.diff
        %open     (open +.diff)
        %invite   (invite +.diff)
        %replace  (replace +.diff)
      ==
    =.  moop
      (~(put by moop) rid group)
    `state
    ::
    ++  open
      |=  =diff:open:policy
      ?-  -.diff
        %allow-ranks     (allow-ranks +.diff)
        %ban-ranks       (ban-ranks +.diff)
        %allow-ships     (allow-ships +.diff)
        %ban-ships       (ban-ships +.diff)
      ==
    ::
    ++  invite
      |=  =diff:invite:policy
      ?-  -.diff
        %add-invites     (add-invites +.diff)
        %remove-invites  (remove-invites +.diff)
      ==
    ::
    ++  allow-ranks
      |=  ranks=(set rank:title)
      ^-  (quip card _group)
      ?>  ?=(%open -.policy.group)
      =.  ban-ranks.policy.group
        (~(dif in ban-ranks.policy.group) ranks)
      `group
    ::
    ++  ban-ranks
      |=  ranks=(set rank:title)
      ^-  (quip card _group)
      ?>  ?=(%open -.policy.group)
      =.  ban-ranks.policy.group
        (~(uni in ban-ranks.policy.group) ranks)
      `group
    ::
    ++  allow-ships
      |=  ships=(set ship)
      ^-  (quip card _group)
      ?>  ?=(%open -.policy.group)
      =.  banned.policy.group
        (~(dif in banned.policy.group) ships)
      `group
    ::
    ++  ban-ships
      |=  ships=(set ship)
      ^-  (quip card _group)
      ?>  ?=(%open -.policy.group)
      =.  banned.policy.group
        (~(uni in banned.policy.group) ships)
      =/  to-remove=(set ship)
        (~(int in members.group) banned.policy.group)
      `group
    ::
    ++  add-invites
      |=  ships=(set ship)
      ^-  (quip card _group)
      ?>  ?=(%invite -.policy.group)
      =.  pending.policy.group
        (~(uni in pending.policy.group) ships)
      `group
    ::
    ++  remove-invites
      |=  ships=(set ship)
      ^-  (quip card _group)
      ?>  ?=(%invite -.policy.group)
      =.  pending.policy.group
        (~(dif in pending.policy.group) ships)
      `group
    ++  replace
      |=  =policy
      ^-  (quip card _group)
      =.  policy.group
        policy
      `group
    --
  --
  
++  weave
  |=  [=eyre-id =inbound-request:eyre]
  ^-  (quip card _state)
  =+  send=(cury response:schooner eyre-id)
  =*  main  ~(. (~(got by mainui) %expo) [bol +.state])
  ::
  =/  ,request-line:server
    (parse-request-line:server url.request.inbound-request)
  ::
  ?+    site  [(send [404 ~ [%stock ~]]) state]
      [%apps %expo ~]
    ?.  authenticated.inbound-request
      [(send [302 ~ [%login-redirect './apps/expo']]) state]
    ?+    method.request.inbound-request
      [(send [405 ~ [%stock ~]]) state]
    ::
        %'GET'
      [(send [200 ~ [%manx (build:main %index ~)]]) state]
    ::
        %'POST'
      ?~  body.request.inbound-request
        [(send [405 ~ [%stock ~]]) state]
      =/  mop=(map @t @t)  
        %-  my
        ^-  (list (pair @t @t))
        %+  rash
          +>.body.request.inbound-request
        yquy:de-purl:html
      =/  ruz=(unit @t)  (~(get by mop) 'resource')
      ?~  ruz
        [(send [405 ~ [%stock ~]]) state]
      =/  who-wat=(unit [dime tape])
        %+  rush  u.ruz
        ;~(pfix sig ;~((glue bar) crub:so (star next)))
      ?~  who-wat
        [(send [200 ~ [%manx (build:main %index ~)]]) state]
      ?>  ?=(%p -<.u.who-wat)
      =+  args=[%resource (rap 3 (scot -.u.who-wat) '|' (crip +.u.who-wat) ~)]~
      [(send [200 ~ [%manx (build:main %index args)]]) state]
    ==
  ==
--