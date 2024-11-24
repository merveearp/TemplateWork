using System;

namespace TemplateWork.Data;

public class DapperRepository<T> : IRepository<T> where T : class
{
    public Task<int> AddAsync(T entity)
    {
        throw new NotImplementedException();
    }

    public Task<int> DeleteAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<IEnumerable<T>> GetAllAsync()
    {
        throw new NotImplementedException();
    }

    public Task<T?> GetAsync(int id)
    {
        throw new NotImplementedException();
    }

    public Task<int> UpdateAsync(T entity)
    {
        throw new NotImplementedException();
    }
}
