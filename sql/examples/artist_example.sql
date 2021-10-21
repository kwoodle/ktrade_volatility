use test;
SELECT p1.a_id, p1.title, p1.price
FROM painting AS p1
         LEFT JOIN painting AS p2 ON p1.a_id = p2.a_id AND p1.price < p2.price
WHERE p2.a_id IS NULL;

-- DuBois, Paul. MySQL Cookbook: Solutions for Database Developers and Administrators (Kindle Locations 17732-17734). O'Reilly Media. Kindle Edition.
