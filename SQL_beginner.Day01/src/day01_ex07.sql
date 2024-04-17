SELECT po.order_date, CONCAT(p.name, ' (age:', p.age, ')') as person_information
  FROM person_order po
  JOIN person p
    ON po.person_id = p.id
ORDER by order_date asc, person_information asc;
