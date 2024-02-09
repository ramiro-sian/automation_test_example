from faker import Faker
from recruitment import Recruitment


class RecruitmentController:

    def set_init_date(self, name, email_address, description):
        return Recruitment.create_new_recruitment(name, email_address, description)

    @staticmethod
    def get_random_name():
        faker = Faker()
        return faker.name()

    @staticmethod
    def get_random_email():
        faker = Faker()
        return faker.email()

    @staticmethod
    def get_random_description():
        faker = Faker()
        return faker.text()