-- Rozwiązanie #1 (bez wszystkich kolumn)

select distinct
    client_id,
    last_value(status) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following)
from contacts
order by contact_id;

-- Rozwiązanie #2 ze wszystkimi kolumnami

select distinct
    last_value(contact_id) over w as contact_id,
    client_id,
    last_value(agent_id) over w as agent_id,
    last_value(status) over w as status,
    last_value(contact_timestamp) over w as contact_timestamp
from contacts
window w as (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following)
order by contact_id;
