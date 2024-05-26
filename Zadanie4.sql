-- Rozwiązanie #1 (bez wszystkich kolumn)

select distinct
    client_id,
    last_value(status) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following)
from contacts
order by contact_id;

-- Rozwiązanie #2 ze wszystkimi kolumnami

select distinct
    last_value(contact_id) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following) as contact_id,
    client_id,
    last_value(agent_id) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following) as agent_id,
    last_value(status) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following) as status,
    last_value(contact_timestamp) over (partition by client_id order by contact_timestamp range between unbounded preceding and unbounded following) as contact_timestamp
from contacts
order by contact_id;
