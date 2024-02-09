from dataclasses import dataclass


@dataclass(slots=True)
class Recruitment:
    name: str
    email_address: str
    description: str

    @classmethod
    def create_new_recruitment(cls, name: str, email_address: str, description: str) -> object:
        return cls(name=name, email_address=email_address, description=description)


