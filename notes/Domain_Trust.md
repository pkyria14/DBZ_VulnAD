# To create a trust between two domains in Active Directory (AD), follow these steps:

1. Open the Active Directory Domains and Trusts snap-in on the domain controller of the trusting domain.
2. In the "Active Directory Domains and Trusts" snap-in, right-click on the name of the trusting domain, and select "Properties".
3. In the "Properties" dialog, click on the "Trusts" tab, and then click on the "New Trust..." button.
4. In the "New Trust Wizard", click "Next" on the "Welcome" page.
5. On the "Trust Name" page, enter the name of the trusted domain, and click "Next".
6. On the "Trust Type" page, select the type of trust that you want to create (e.g. "External trust" or "Realm trust") and click "Next".
7. On the "Direction of Trust" page, select the direction of the trust (e.g. "Two-way" or "One-way: outgoing") and click "Next".
8. On the "Sides of Trust" page, select the domain controller of the trusted domain as the "Trusted domain", and click "Next".
9. On the "Outgoing Trust Authentication Level" page, select the authentication level for the outgoing trust, and click "Next".
10. On the "Incoming Trust Authentication Level" page, select the authentication level for the incoming trust, and click "Next".
11. Review the summary on the "Completing the New Trust Wizard" page, and click "Next" to create the trust.
12. When the trust has been created, click "Finish" to exit the wizard.

After the trust has been created, users in the trusting domain will be able to access resources in the trusted domain using their AD credentials. You can use the "Active Directory Domains and Trusts" snap-in to manage the trust, including modifying its properties or deleting it.