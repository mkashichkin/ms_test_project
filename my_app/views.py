from my_app.db import db_session
from my_app.db.models.street import Street
from my_app.db.models.city import City
from my_app.db.models.shop import Shop
from datetime import datetime
from rest_framework.decorators import api_view
from rest_framework import status
from rest_framework.response import Response
from sqlalchemy import or_, between, not_


@api_view(['GET'])
def list_of_cities(request):
    if request.method == 'GET':
        db_session.global_init()
        session = db_session.create_session()
        cities = {'cities': [city.city_name for city in session.query(City)]}
        session.close()
        return Response(cities)
    return Response(status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def list_of_streets_for_city(request, city_id):
    if request.method == 'GET':
        db_session.global_init()
        session = db_session.create_session()
        name_of_the_city = session.query(City).filter(City.id == city_id).first()
        streets = {name_of_the_city.city_name: [street.street_name for street in
                                            session.query(Street).filter(Street.city_id == city_id)]}
        session.close()
        return Response(streets)
    return Response(status.HTTP_400_BAD_REQUEST)


@api_view(['GET', 'POST'])
def get_or_add_shop(request):
    if request.method == 'GET':
        try:
            db_session.global_init()
            session = db_session.create_session()
            street_id = session.query(Street).filter(Street.street_name == request.GET.get('street')).first()
            city_id = session.query(City).filter(City.city_name == request.GET.get('city')).first()
            if street_id:
                street_id = street_id.id
            if city_id:
                city_id = city_id.id
            open = request.GET.get('open')
            if not open or int(open) == 1:
                shops = {'shops': [shop.shop_name for shop in session.query(Shop).filter(
                    or_(not city_id, Shop.city_id == city_id),
                    or_(not street_id, Shop.street_id == street_id),
                    or_(not open, between(datetime.now().time(), Shop.time_open, Shop.time_close)))]}
                session.close()
                return Response(shops)
            else:
                shops = {'shops': [shop.shop_name for shop in session.query(Shop).filter(
                    or_(not city_id, Shop.city_id == city_id),
                    or_(not street_id, Shop.street_id == street_id),
                    not_(between(datetime.now().time(), Shop.time_open, Shop.time_close)))]}
                session.close()
                return Response(shops)
        except:
            return Response(status.HTTP_400_BAD_REQUEST)
    if request.method == 'POST':
        data = request.data
        try:
            shop = Shop(data['shop_name'], data['city_id'], data['street_id'],
                        data['home'], data['time_open'], data['time_close'])
            db_session.global_init()
            session = db_session.create_session()
            if session.query(Street).filter(data['street_id'] == Street.id).first().city_id != int(data['city_id']):
                return Response(status.HTTP_400_BAD_REQUEST)
            session.add(shop)
            session.commit()
            session.close()
            return Response(session.query(Shop).all()[-1].id)
        except:
            return Response(status.HTTP_400_BAD_REQUEST)
    return Response(status.HTTP_400_BAD_REQUEST)

