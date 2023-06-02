select
	p.project_name,
	p.sales_price_cent / 100 as sales_price_eur,
	sum(ie.invest_cent)/ 100 as invest_eur,
	sum((te.time_spent_min / 60)*(ec.hourly_rate_cent / 100)) as time_invest_eur
from
	projects p
left join invest_efforts ie on
	p.id = ie.project_id
left join time_efforts te on 
	p.id = te.project_id
left join employees e on
	te.employee_id = e.id
left join employee_class ec on
	e.employee_class = ec.id
group by
	p.id;


select
	p.id,
	p.project_name,
	p.sales_price_eur as sales_price_eur,
	sum(ie.invest_eur) as invest_eur,
	sum((te.time_spent_h)*(ec.hourly_rate_eur)) as time_invest_eur,
	sum(te.time_spent_h) as time_invest_hours
from
	projects p
left join invest_efforts ie on
	p.id = ie.project_id
left join time_efforts te on 
	p.id = te.project_id
left join employees e on
	te.employee_id = e.id
left join employee_class ec on
	e.employee_class = ec.id
group by
	p.id;


select
	te.project_id,
	te.time_spent_min,
	te.employee_id,
	ec.hourly_rate_cent,
	(te.time_spent_min / 60)*(ec.hourly_rate_cent / 100) as time_invest_eur
from
	time_efforts te
left join employees e on
	te.employee_id = e.id
left join employee_class ec on
	e.employee_class = ec.id;