import datetime
import sqlalchemy
from sqlalchemy import orm
from my_app.db.db_session import SqlAlchemyBase


class Street(SqlAlchemyBase):
    __tablename__ = 'streets'
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True, autoincrement=True)
    street_name = sqlalchemy.Column(sqlalchemy.String, nullable=False)
    city_id = sqlalchemy.Column(sqlalchemy.Integer, sqlalchemy.ForeignKey("cities.id"))
    city = orm.relation('City')

    def __repr__(self):
        return f'Street.id: {self.id}, Street.street_name: {self.street_name}, City.name: {self.city.city_name}'

    def __str__(self):
        return f'Street.id: {self.id}, Street.street_name: {self.street_name}, City.name: {self.city.city_name}'