 
class HotelsData {
    int? status;
    dynamic msg;
    Results? results;

    HotelsData({
        this.status,
        this.msg,
        this.results,
    });

    factory HotelsData.fromJson(Map<String, dynamic> json) => HotelsData(
        status: json["status"],
        msg: json["msg"],
        results: Results.fromJson(json["results"]),
    );
 
}

class Results {
    List<Datum> ?data;
    Paging? paging;

    Results({
        this.data,
        this.paging,
    });

    factory Results.fromJson(Map<String, dynamic> json) => Results(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        paging: Paging.fromJson(json["paging"]),
    ); 
}

class Datum {
    String? locationId;
    String? name;
    String? latitude;
    String? longitude;
    String? numReviews;
    String? timezone;
    String? locationString;
    Photo? photo;
    String? apiDetailUrl;
    List<dynamic>? awards;
    String? doubleclickZone;
    String? preferredMapEngine;
    String? rawRanking;
    String? rankingGeo;
    String? rankingGeoId;
    String? rankingPosition;
    String? rankingDenominator;
    String? rankingCategory;
    String? ranking;
    String? subcategoryType;
    String? subcategoryTypeLabel;
    dynamic distance;
    dynamic distanceString;
    dynamic bearing;
    String? rating;
    bool? isClosed;
    String? openNowText;
    bool? isLongClosed;
    String? priceLevel;
    String? price;
    List<NeighborhoodInfo>? neighborhoodInfo;
    String? hotelClass;
    String? hotelClassAttribution;
    BusinessListings? businessListings;
    SpecialOffers? specialOffers;
    String? description;
    String? webUrl;
    String? writeReview;
    List<Ancestor>? ancestors;
    Category? category;
    List<Category>? subcategory;
    String? parentDisplayName;
    bool? isJfyEnabled;
    List<dynamic>? nearestMetroStation;
    String? phone;
    String? website;
    AddressObj? addressObj;
    String? address;
    bool? isCandidateForContactInfoSuppression;
    List<dynamic>? amenities;
    String? ownerWebsite;
    String?email;

    Datum({
        this.locationId,
        this.name,
        this.latitude,
        this.longitude,
        this.numReviews,
        this.timezone,
        this.locationString,
        this.photo,
        this.apiDetailUrl,
        this.awards,
        this.doubleclickZone,
        this.preferredMapEngine,
        this.rawRanking,
        this.rankingGeo,
        this.rankingGeoId,
        this.rankingPosition,
        this.rankingDenominator,
        this.rankingCategory,
        this.ranking,
        this.subcategoryType,
        this.subcategoryTypeLabel,
        this.distance,
        this.distanceString,
        this.bearing,
        this.rating,
        this.isClosed,
        this.openNowText,
        this.isLongClosed,
        this.priceLevel,
        this.price,
        this.neighborhoodInfo,
        this.hotelClass,
        this.hotelClassAttribution,
        this.businessListings,
        this.specialOffers,
        this.description,
        this.webUrl,
        this.writeReview,
        this.ancestors,
        this.category,
        this.subcategory,
        this.parentDisplayName,
        this.isJfyEnabled,
        this.nearestMetroStation,
        this.phone,
        this.website,
        this.addressObj,
        this.address,
        this.isCandidateForContactInfoSuppression,
        this.amenities,
        this.ownerWebsite,
        this.email,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        locationId: json["location_id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        numReviews: json["num_reviews"],
        timezone: json["timezone"],
        locationString: json["location_string"],
        photo: Photo.fromJson(json["photo"]),
        apiDetailUrl: json["api_detail_url"],
        awards: List<dynamic>.from(json["awards"].map((x) => x)),
        doubleclickZone: json["doubleclick_zone"],
        preferredMapEngine: json["preferred_map_engine"],
        rawRanking: json["raw_ranking"],
        rankingGeo: json["ranking_geo"],
        rankingGeoId: json["ranking_geo_id"],
        rankingPosition: json["ranking_position"],
        rankingDenominator: json["ranking_denominator"],
        rankingCategory: json["ranking_category"],
        ranking: json["ranking"],
        subcategoryType: json["subcategory_type"],
        subcategoryTypeLabel: json["subcategory_type_label"],
        distance: json["distance"],
        distanceString: json["distance_string"],
        bearing: json["bearing"],
        rating: json["rating"],
        isClosed: json["is_closed"],
        openNowText: json["open_now_text"],
        isLongClosed: json["is_long_closed"],
        priceLevel: json["price_level"],
        price: json["price"],
        neighborhoodInfo: List<NeighborhoodInfo>.from(json["neighborhood_info"].map((x) => NeighborhoodInfo.fromJson(x))),
        hotelClass: json["hotel_class"],
        hotelClassAttribution: json["hotel_class_attribution"],
        businessListings: BusinessListings.fromJson(json["business_listings"]),
        specialOffers: SpecialOffers.fromJson(json["special_offers"]),
        description: json["description"],
        webUrl: json["web_url"],
        writeReview: json["write_review"],
        ancestors: List<Ancestor>.from(json["ancestors"].map((x) => Ancestor.fromJson(x))),
        category: Category.fromJson(json["category"]),
        subcategory: List<Category>.from(json["subcategory"].map((x) => Category.fromJson(x))),
        parentDisplayName: json["parent_display_name"],
        isJfyEnabled: json["is_jfy_enabled"],
        nearestMetroStation: List<dynamic>.from(json["nearest_metro_station"].map((x) => x)),
        phone: json["phone"],
        website: json["website"],
        addressObj: AddressObj.fromJson(json["address_obj"]),
        address: json["address"],
        isCandidateForContactInfoSuppression: json["is_candidate_for_contact_info_suppression"],
        amenities: List<dynamic>.from(json["amenities"].map((x) => x)),
        ownerWebsite: json["owner_website"],
        email: json["email"],
    );
 
}

class AddressObj {
    String? street1;
    String? street2;
    String? city;
    String? states;
    String? country;
    String? postalcode;

    AddressObj({
        this.street1,
        this.street2,
        this.city,
        this.states,
        this.country,
        this.postalcode,
    });

    factory AddressObj.fromJson(Map<String, dynamic> json) => AddressObj(
        street1: json["street1"],
        street2: json["street2"],
        city: json["city"],
        states: json["states"],
        country: json["country"],
        postalcode: json["postalcode"],
    ); 
}

class Ancestor {
    List<Category>? subcategory;
    String? name;
    String? abbrv;
    String? locationId;

    Ancestor({
        this.subcategory,
        this.name,
        this.abbrv,
        this.locationId,
    });

    factory Ancestor.fromJson(Map<String, dynamic> json) => Ancestor(
        subcategory: List<Category>.from(json["subcategory"].map((x) => Category.fromJson(x))),
        name: json["name"],
        abbrv: json["abbrv"],
        locationId: json["location_id"],
    ); 
}

class Category {
    String? key;
    String? name;

    Category({
        this.key,
        this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        key: json["key"],
        name: json["name"],
    ); 
}

class BusinessListings {
    List<dynamic>? desktopContacts;
    List<MobileContact>? mobileContacts;

    BusinessListings({
        this.desktopContacts,
        this.mobileContacts,
    });

    factory BusinessListings.fromJson(Map<String, dynamic> json) => BusinessListings(
        desktopContacts: List<dynamic>.from(json["desktop_contacts"].map((x) => x)),
        mobileContacts: List<MobileContact>.from(json["mobile_contacts"].map((x) => MobileContact.fromJson(x))),
    ); 
}

class MobileContact {
    String? value;
    String? label;
    String? type;
    String? offerlessCommerceTrackUrl;

    MobileContact({
        this.value,
        this.label,
        this.type,
        this.offerlessCommerceTrackUrl,
    });

    factory MobileContact.fromJson(Map<String, dynamic> json) => MobileContact(
        value: json["value"],
        label: json["label"],
        type: json["type"],
        offerlessCommerceTrackUrl: json["offerless_commerce_track_url"],
    );

    Map<String, dynamic> toJson() => {
        "value": value,
        "label": label,
        "type": type,
        "offerless_commerce_track_url": offerlessCommerceTrackUrl,
    };
}

class NeighborhoodInfo {
    String? locationId;
    String? name;

    NeighborhoodInfo({
        this.locationId,
        this.name,
    });

    factory NeighborhoodInfo.fromJson(Map<String, dynamic> json) => NeighborhoodInfo(
        locationId: json["location_id"],
        name: json["name"],
    ); 
}

class Photo {
    Images? images;
    bool? isBlessed;
    String? uploadedDate;
    String? caption;
    String? id;
    String? helpfulVotes;
    String? publishedDate;
    User? user;

    Photo({
        this.images,
        this.isBlessed,
        this.uploadedDate,
        this.caption,
        this.id,
        this.helpfulVotes,
        this.publishedDate,
        this.user,
    });

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        images: Images.fromJson(json["images"]),
        isBlessed: json["is_blessed"],
        uploadedDate: json["uploaded_date"],
        caption: json["caption"],
        id: json["id"],
        helpfulVotes: json["helpful_votes"],
        publishedDate: json["published_date"],
        user: User.fromJson(json["user"]),
    );
 
}

class Images {
    Large? small;
    Large? thumbnail;
    Large? original;
    Large? large;
    Large? medium;

    Images({
        this.small,
        this.thumbnail,
        this.original,
        this.large,
        this.medium,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        thumbnail: Large.fromJson(json["thumbnail"]),
        original: Large.fromJson(json["original"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
    ); 
}

class Large {
    String? width;
    String? url;
    String? height;

    Large({
        this.width,
        this.url,
        this.height,
    });

    factory Large.fromJson(Map<String, dynamic> json) => Large(
        width: json["width"],
        url: json["url"],
        height: json["height"],
    ); 
}

class User {
    dynamic userId;
    String? memberId;
    String? type;

    User({
        this.userId,
        this.memberId,
        this.type,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["user_id"],
        memberId: json["member_id"],
        type: json["type"],
    ); 
}

class SpecialOffers {
    List<dynamic>? desktop;
    List<Mobile> ?mobile;

    SpecialOffers({
        this.desktop,
        this.mobile,
    });

    factory SpecialOffers.fromJson(Map<String, dynamic> json) => SpecialOffers(
        desktop: List<dynamic>.from(json["desktop"].map((x) => x)),
        mobile: List<Mobile>.from(json["mobile"].map((x) => Mobile.fromJson(x))),
    ); 
}

class Mobile {
    String? headline;
    String? url;
    String? offerlessClickTrackingUrl;

    Mobile({
        this.headline,
        this.url,
        this.offerlessClickTrackingUrl,
    });

    factory Mobile.fromJson(Map<String, dynamic> json) => Mobile(
        headline: json["headline"],
        url: json["url"],
        offerlessClickTrackingUrl: json["offerless_click_tracking_url"],
    ); 
}

class Paging {
    dynamic previous;
    String? next;
    String? skipped;
    String? results;
    String? totalResults;

    Paging({
        this.previous,
        this.next,
        this.skipped,
        this.results,
        this.totalResults,
    });

    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        previous: json["previous"],
        next: json["next"],
        skipped: json["skipped"],
        results: json["results"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "previous": previous,
        "next": next,
        "skipped": skipped,
        "results": results,
        "total_results": totalResults,
    };
}
