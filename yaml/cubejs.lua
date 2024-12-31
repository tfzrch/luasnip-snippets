return {
  -- Cube
  s({trig="cube", name="cubejs-yml-cube"}, fmt([[
  cubes:
    - name: {1}
      data_source: "{2}"
      public: false
      sql_table: "public.\"{3}\""
      sql_alias: {4}

      joins: []

      dimensions: []

      measures: []

      segments: []

      pre_aggregations: []
  ]], {
    [1] = i(1, "cube"),
    [2] = i(2, "data_source"),
    [3] = i(3, "sql_table"),
    [4] = i(4, "sql_alias")
  })),
  -- Basic Cube Column
  s({trig="cyc", name="cubejs-yml-column"}, fmt([[
    - name: {1}
      title: {2}
      sql: "{3}"
      type: {4}
  ]], {
    [1] = i(1, "column_name"),
    [2] = i(2, "title"),
    [3] = i(3, "sql"),
    [4] = i(4, "type")
  })),
  -- Cube Case Column
  s({trig="case", name="cubejs-yml-case-column"}, fmt([[
  - name: {1}
    title: {2}
    case:
      when:
       - sql: "{3}"
         label:
          sql: "{4}"
      else:
        label:
          sql: "{5}"
    type: "{6}"
  ]], {
    [1] = i(1, "column_name"),
    [2] = i(2, "title"),
    [3] = i(3, "when sql"),
    [4] = i(4, "when label sql"),
    [5] = i(5, "else label sql"),
    [6] = i(6, "type")
  })),
  s({trig="when-sql", name="CubeJS YML when with sql label"}, fmt([[
  - sql: "{1}"
    label:
      sql: "{2}"
  ]],{
    [1] = i(1, "when sql"),
    [2] = i(2, "when label sql")
  })),
  s({trig="when-txt", name="CubeJS YML when with text label"}, fmt([[
  - sql: "{1}"
    label: "{2}"
  ]],{
    [1] = i(1, "when sql"),
    [2] = i(2, "when label")
  })),
  -- SubQuery Column
  s({trig="subq", name="CubeJS YML sub-query dimension"}, fmt([[
  - name: {1}
    title: {2}
    sql: "{{{3}.{4}}}"
    type: {5}
    sub_query: true
  ]], {
    [1] = i(1, "dimension"),
    [2] = i(2, "title"),
    [3] = i(3, "cube"),
    [4] = i(4, "measure"),
    [5] = i(5, "type")
  })),
  -- View
  s({trig="view", name="cubejs-yml-view"}, fmt([[
  views:
    - name: {1}
      cubes:
        - join_path: {2}
          includes:
            - {3}
  ]], {
    [1] = i(1, "view"),
    [2] = i(2, "first cube"),
    [3] = i(3, "first column")
  })),
  -- View Join Path
  s({trig="join_path", name="cubejs-yml-view join-path"}, fmt([[
  - join_path: {1}
    includes:
      - {2}
  ]], {
    [1] = i(1, "cubes"),
    [2] = i(2, "first column")
  })),
  -- View Column with Alias
  s({trig="alias", name = "cubejs-yml-view-aliased-column"}, fmt([[
  - name: {1}
    alias: {2}
  ]], {
    [1] = i(1, "column"),
    [2] = i(2, "alias")
  }))
}
