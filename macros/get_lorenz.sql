{% macro get_lorenz(column_name, relation, group_by) %}

{%- set relation_query %}
	with value as (select
	{%- if group_by %}
		{{ group_by }},
	{%- endif %}	
		sum({{ column_name }}) as sum_value
	FROM
		{{ relation -}}
	{% if group_by %}
	GROUP BY
		{{ group_by }}
	{% endif -%}		
	order by
		sum_value desc
	)

	select
	{%- if group_by %}
		{{ group_by }},
	{% endif -%}	
		100*(sum(sum_value) over (
			order by sum_value asc rows between unbounded preceding and current row
		))/(sum(sum_value) over ()) as cumm_value_pct
	from
		value
	order by 
		cumm_value_pct desc	
{% endset -%}

{{ return(relation_query) }}


{% endmacro %}