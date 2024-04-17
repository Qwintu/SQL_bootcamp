SELECT po.order_date, CONCAT(p.name, ' (age:', p.age, ')') as person_information
  FROM person_order po(po_id, id, menu_id, order_date) -- переименовываем столбцы тутб можно в selert через as
  NATURAL JOIN person p
ORDER by order_date asc, person_information asc;