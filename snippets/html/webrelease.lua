-- LuaSnip 由来の wr-* スニペットを LSP 形式に移行（HTML）
return {
  {
    prefix = 'wr-if',
    desc = '<wr-if> … </wr-if>',
    body = [[<wr-if condition="${1:condition}">
  <wr-then>
    ${2:<!-- then -->}
  </wr-then>
  <wr-else>
    ${3:<!-- else -->}
  </wr-else>
</wr-if>]],
  },
  {
    prefix = 'wr-ifc',
    desc = '<wr-if> compact',
    body = [[<wr-if condition="${1:condition}">
  ${2:<!-- content -->}
</wr-if>]],
  },
  {
    prefix = 'wr-switch',
    desc = '<wr-switch> … </wr-switch>',
    body = [[<wr-switch value="${1:variable}">
  <wr-case value="${2:value1}">
    ${3:<!-- case content -->}
  </wr-case>
  <wr-default>
    ${4:<!-- default content -->}
  </wr-default>
</wr-switch>]],
  },
  {
    prefix = 'wr-case',
    desc = '<wr-case> … </wr-case>',
    body = [[<wr-case value="${1:value}">
  ${2:<!-- content -->}
</wr-case>]],
  },
  {
    prefix = 'wr-conditional',
    desc = '<wr-conditional> … </wr-conditional>',
    body = [[<wr-conditional>
  <wr-cond condition="${1:condition1}">
    ${2:<!-- content 1 -->}
  </wr-cond>
  <wr-cond condition="true">
    ${3:<!-- else content -->}
  </wr-cond>
</wr-conditional>]],
  },
  {
    prefix = 'wr-cond',
    desc = '<wr-cond> … </wr-cond>',
    body = [[<wr-cond condition="${1:condition}">
  ${2:<!-- content -->}
</wr-cond>]],
  },
  {
    prefix = 'wr-for',
    desc = '<wr-for list …>',
    body = [[<wr-for list="${1:collection}" variable="${2:item}">
  ${3:<!-- content -->}
</wr-for>]],
  },
  {
    prefix = 'wr-fort',
    desc = '<wr-for times …>',
    body = [[<wr-for times="${1:10}" count="${2:i}">
  ${3:<!-- content -->}
</wr-for>]],
  },
  {
    prefix = 'wr-break',
    desc = '<wr-break />',
    body = '<wr-break />',
  },
  {
    prefix = 'wr-breakc',
    desc = '<wr-break condition … />',
    body = '<wr-break condition="${1:condition}" />',
  },
  {
    prefix = 'wr-var',
    desc = '<wr-variable … />',
    body = '<wr-variable name="${1:var_name}" value="${2:value}" />',
  },
  {
    prefix = 'wr-varb',
    desc = '<wr-variable> block',
    body = [[<wr-variable name="${1:var_name}">
  ${2:<!-- value -->}
</wr-variable>]],
  },
  {
    prefix = 'wr-append',
    desc = '<wr-append … />',
    body = '<wr-append name="${1:var_name}" value="${2:value_to_append}" />',
  },
  {
    prefix = 'wr-appendb',
    desc = '<wr-append> block',
    body = [[<wr-append name="${1:var_name}">
  ${2:<!-- value to append -->}
</wr-append>]],
  },
  {
    prefix = 'wr-clear',
    desc = '<wr-clear … />',
    body = '<wr-clear name="${1:var_name}" />',
  },
  {
    prefix = 'wr-return',
    desc = '<wr-return … />',
    body = '<wr-return value="${1:return_value}" />',
  },
  {
    prefix = 'wr-returnb',
    desc = '<wr-return> block',
    body = [[<wr-return>
  ${1:<!-- return value -->}
</wr-return>]],
  },
  {
    prefix = 'wr-error',
    desc = '<wr-error> … </wr-error>',
    body = [[<wr-error>
  ${1:Error message}
</wr-error>]],
  },
  {
    prefix = 'wr-errorc',
    desc = '<wr-error condition …>',
    body = [[<wr-error condition="${1:condition}">
  ${2:Error message}
</wr-error>]],
  },
  {
    prefix = 'wr-comment',
    desc = '<wr-comment> … </wr-comment>',
    body = [[<wr-comment>
  ${1:comment}
</wr-comment>]],
  },
}
