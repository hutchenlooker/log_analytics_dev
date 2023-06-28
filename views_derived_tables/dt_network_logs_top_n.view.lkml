view: dt_network_logs_top_n {
     derived_table: {
      explore_source: network_logs {
        bind_all_filters: yes
        column: total_bytes_sent {}
        column: breakdown_dimension_src_dest {}
        derived_column: ranking {
          sql: rank() over (order by total_bytes_sent desc);;
          }
      }
    }


    dimension: breakdown_dimension_src_dest {
      hidden: yes
      primary_key: yes
    }

    dimension: ranking {
      type: number
      sql: ${TABLE}.ranking ;;
    }

#### This parameter will allow a user to select a Top N ranking limit for bucketing the brands, almost like parameterizing the Row Limit in the UI
  parameter: top_rank_limit {
    #view_label: " TOTT | Top N Ranking"
    type: unquoted
    default_value: "15"
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 15"
      value: "15"
    }
    allowed_value: {
      label: "Top 25"
      value: "25"
    }
    }


  dimension: top_src_dest {
    label: "Src / Dest (Top {% if top_rank_limit._is_filtered %}{% parameter top_rank_limit %}{% else %}N{% endif %})"
    order_by_field: top_src_dest_rank
    type: string
    sql:
      CASE
        WHEN ${ranking}<={% parameter top_rank_limit %} THEN ${breakdown_dimension_src_dest}
        ELSE 'Rest of Traffic'
      END
    ;;
  }

  dimension: top_src_dest_rank {
    # only used to order the top_src_dest dimension
    hidden: yes
    label_from_parameter: top_rank_limit
    type: number
    sql:
      CASE
        WHEN ${ranking}<={% parameter top_rank_limit %}
          THEN
            ${ranking}
        ELSE 9999999
      END
    ;;
  }


  }
