global class MyWebService {
    webService static String makeContact(String ltName, Account des) {
        Contact c = new Contact(lastName = ltName, Account=des);
        insert c;
        return c.id;
    }
}