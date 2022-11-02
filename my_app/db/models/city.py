import datetime
import sqlalchemy
from sqlalchemy import orm
from my_app.db.db_session import SqlAlchemyBase


class City(SqlAlchemyBase):
    __tablename__ = 'cities'
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True, autoincrement=True)
    city_name = sqlalchemy.Column(sqlalchemy.String, nullable=False)

    def __repr__(self):
        return f'City.id: {self.id}, City.city_name: {self.city_name}'

    def __str__(self):
        return f'City.id: {self.id}, City.city_name: {self.city_name}'