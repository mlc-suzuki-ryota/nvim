local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require 'luasnip.util.events'
local ai = require 'luasnip.nodes.absolute_indexer'
local fmt = require("luasnip.extras.fmt").fmt

return {
  s("wr-if", fmt(
    [[
      <wr-if condition="{}">
        <wr-then>
          {}
        </wr-then>
        <wr-else>
          {}
        </wr-else>
      </wr-if>
    ]],
    { i(1, "condition"), i(2, "<!-- then -->"), i(3, "<!-- else -->") }
  )),

  s("wr-ifc", fmt(
    [[
      <wr-if condition="{}">
        {}
      </wr-if>
    ]],
    { i(1, "condition"), i(2, "<!-- content -->") }
  )),

  s("wr-switch", fmt(
    [[
      <wr-switch value="{}">
        <wr-case value="{}">
          {}
        </wr-case>
        <wr-default>
          {}
        </wr-default>
      </wr-switch>
    ]],
    { i(1, "variable"), i(2, "value1"), i(3, "<!-- case content -->"), i(4, "<!-- default content -->") }
  )),

  s("wr-case", fmt(
    [[
      <wr-case value="{}">
        {}
      </wr-case>
    ]],
    { i(1, "value"), i(2, "<!-- content -->") }
  )),

  s("wr-conditional", fmt(
    [[
      <wr-conditional>
        <wr-cond condition="{}">
          {}
        </wr-cond>
        <wr-cond condition="true">
          {}
        </wr-cond>
      </wr-conditional>
    ]],
    { i(1, "condition1"), i(2, "<!-- content 1 -->"), i(3, "<!-- else content -->") }
  )),

  s("wr-cond", fmt(
    [[
      <wr-cond condition="{}">
        {}
      </wr-cond>
    ]],
    { i(1, "condition"), i(2, "<!-- content -->") }
  )),

  s("wr-for", fmt(
    [[
      <wr-for list="{}" variable="{}">
        {}
      </wr-for>
    ]],
    { i(1, "collection"), i(2, "item"), i(3, "<!-- content -->") }
  )),

  s("wr-fort", fmt(
    [[
      <wr-for times="{}" count="{}">
        {}
      </wr-for>
    ]],
    { i(1, "10"), i(2, "i"), i(3, "<!-- content -->") }
  )),

  s("wr-break", fmt("<wr-break />", {})),

  s("wr-breakc", fmt(
    [[<wr-break condition="{}" />]],
    { i(1, "condition") }
  )),

  s("wr-var", fmt(
    [[<wr-variable name="{}" value="{}" />]],
    { i(1, "var_name"), i(2, "value") }
  )),

  s("wr-varb", fmt(
    [[
      <wr-variable name="{}">
        {}
      </wr-variable>
    ]],
    { i(1, "var_name"), i(2, "<!-- value -->") }
  )),

  s("wr-append", fmt(
    [[<wr-append name="{}" value="{}" />]],
    { i(1, "var_name"), i(2, "value_to_append") }
  )),

  s("wr-appendb", fmt(
    [[
      <wr-append name="{}">
        {}
      </wr-append>
    ]],
    { i(1, "var_name"), i(2, "<!-- value to append -->") }
  )),

  s("wr-clear", fmt(
    [[<wr-clear name="{}" />]],
    { i(1, "var_name") }
  )),

  s("wr-return", fmt(
    [[<wr-return value="{}" />]],
    { i(1, "return_value") }
  )),

  s("wr-returnb", fmt(
    [[
      <wr-return>
        {}
      </wr-return>
    ]],
    { i(1, "<!-- return value -->") }
  )),

  s("wr-error", fmt(
    [[
      <wr-error>
        {}
      </wr-error>
    ]],
    { i(1, "Error message") }
  )),

  s("wr-errorc", fmt(
    [[
      <wr-error condition="{}">
        {}
      </wr-error>
    ]],
    { i(1, "condition"), i(2, "Error message") }
  )),

  s("wr-comment", fmt(
    [[
      <wr-comment>
        {}
      </wr-comment>
    ]],
    { i(1, "comment") }
  )),
}
