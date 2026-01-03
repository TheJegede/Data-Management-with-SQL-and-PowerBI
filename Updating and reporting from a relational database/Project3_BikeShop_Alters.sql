use bikeshop;

SET sql_mode = 'NO_ZERO_DATE';

alter table employee add (
 constraint foreign key (currentmanager) references employee(employeeID)
);

alter table bicycle add (
 constraint foreign key (customerid) references customer(customerID),
 constraint foreign key (employeeid) references employee(employeeID),
 constraint foreign key (shipemployee) references employee(employeeID),
 constraint foreign key (frameassembler) references employee(employeeID),
 constraint foreign key (painter) references employee(employeeID)
);
