#pragma once
#include <sstream>
#include <numeric>
#include <cmath>

// (n / m) m>0
struct ration_num
{
    int64_t n;
    int64_t m = 1;
    ration_num(){};
    ration_num(int64_t num) : n(num){};
    ration_num(int64_t num_1, int64_t num_2) : n(num_1), m(num_2){};
    ration_num(std::string &r_1)
    {
        size_t pos = r_1.find("/");
        if (pos == std::string::npos)
        {
            this->n = atoll(r_1.c_str());
        }
        else
        {
            std::string str_1 = r_1.substr(0, pos);
            this->n = atoll(str_1.c_str());
            std::string str_2 = r_1.substr(pos + 1, r_1.size());
            this->m = atoll(str_2.c_str());
        }
    }
    void simplify()
    {
        int64_t gcd = std::gcd(this->n, this->m);
        this->n /= gcd;
        this->m /= gcd;
    }
    ration_num &operator=(const int64_t &r_1)
    {
        this->n = r_1;
        this->m = 1;
        return *this;
    }
    ration_num &operator=(const ration_num &r_1)
    {
        this->n = r_1.n;
        this->m = r_1.m;
        return *this;
    }

    ration_num operator*(const ration_num &r_1) const
    {
        ration_num r_new(this->n * r_1.n, this->m * r_1.m);
        r_new.simplify();
        return r_new;
    }
    ration_num &operator*=(const ration_num &r_1)
    {
        *this = *this * r_1;
        return *this;
    }
    ration_num &operator*=(const int64_t &r_1)
    {
        *this = ((*this) * ration_num(r_1));
        return *this;
    }

    ration_num operator/(const ration_num &r_1) const
    {
        ration_num r_new(this->n * r_1.m, this->m * r_1.n);
        if (r_new.m < 0)
        {
            r_new.n = -(r_new.n);
            r_new.m = -r_new.m;
        }
        r_new.simplify();
        return r_new;
    }

    ration_num &operator/=(const ration_num &r_1)
    {
        *this = *this / r_1;
        return *this;
    }
    ration_num &operator/=(const int64_t &r_1)
    {
        *this = ((*this) / ration_num(r_1));
        return *this;
    }
    friend ration_num operator/(const int &a, const ration_num &b) { return ration_num(a) / b; }

    ration_num operator+(const ration_num &r_1) const
    {
        int64_t new_m = std::lcm(this->m, r_1.m);
        int64_t new_n = ((new_m / this->m) * this->n) + ((new_m / r_1.m) * r_1.n);
        ration_num r_new(new_n, new_m);
        r_new.simplify();
        return r_new;
    }

    ration_num &operator+=(const ration_num &r_1)
    {
        *this = *this + r_1;
        return *this;
    }

    ration_num operator-(const ration_num &r_1) const
    {
        int64_t new_m = std::lcm(this->m, r_1.m);
        int64_t new_n = ((new_m / this->m) * this->n) - ((new_m / r_1.m) * r_1.n);
        ration_num r_new(new_n, new_m);
        r_new.simplify();
        return r_new;
    }
    ration_num &operator-=(const ration_num &r_1)
    {
        *this = *this - r_1;
        return *this;
    }
    ration_num operator-() const { return ration_num(-this->n, this->m); }
    friend ration_num operator-(const int &a, const ration_num &b) { return ration_num(a) - b; }

    bool operator>(const ration_num &r_1) const { return this->n * r_1.m > r_1.n * this->m; }
    bool operator>(const int &r_1) const { return this->n > r_1 * this->m; }
    friend bool operator>(const int &a, const ration_num &b) { return a * b.m > b.n; }

    bool operator>=(const ration_num &r_1) const { return this->n * r_1.m >= r_1.n * this->m; }
    bool operator>=(const int &r_1) const { return this->n >= r_1 * this->m; }
    friend bool operator>=(const int &a, const ration_num &b) { return a * b.m >= b.n; }

    bool operator<(const ration_num &r_1) const { return this->n * r_1.m < r_1.n * this->m; }
    bool operator<(const int &r_1) const { return this->n < r_1 * this->m; }
    friend bool operator<(const int &a, const ration_num &b) { return a * b.m < b.n; }

    bool operator<=(const ration_num &r_1) const { return this->n * r_1.m <= r_1.n * this->m; }
    bool operator<=(const int &r_1) const { return this->n <= r_1 * this->m; }
    friend bool operator<=(const int &a, const ration_num &b) { return a * b.m <= b.n; }

    bool operator==(const ration_num &r_1) const { return this->n * r_1.m == r_1.n * this->m; }
    bool operator==(const int &r_1) const { return this->n == r_1 * this->m; }
    bool operator==(const uint64_t &r_1) const { return this->n == (int)r_1 * this->m; }
    friend bool operator==(const int &a, const ration_num &b) { return (a * b.m) == b.n; }

    bool operator!=(const ration_num &r_1) const { return this->n * r_1.m != r_1.n * this->m; }
    bool operator!=(const int &r_1) const { return this->n != r_1 * this->m; }
    friend bool operator!=(const int &a, const ration_num &b) { return a * b.m != b.n; }

    ration_num abs() const { return ration_num(std::abs(this->n), this->m); }
    int64_t to_int() { return (this->n / this->m); }
    double to_double() { return ((double)this->n) / ((double)this->m); }
    ration_num pow(int exp) { return ration_num(std::pow(this->n, exp), std::pow(this->m, exp)); }

    std::string print() const
    {
        std::stringstream ss;
        if (this->m == 1)
        {
            ss << this->n;
        }
        else
        {
            ss << "( " << this->n << " / " << this->m << ")";
        }
        return ss.str();
    }

    // if it is an integer, then +/- 1, else round to the closest integer
    ration_num upper_round()
    {
        int64_t n = (this->m == 1) ? (this->n + 1) : (std::ceil((double)this->n / (double)this->m));
        return ration_num(n);
    }
    ration_num lower_round()
    {
        int64_t n = (this->m == 1) ? (this->n - 1) : (std::floor((double)this->n / (double)this->m));
        return ration_num(n);
    }
};
